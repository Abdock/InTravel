using System;
using InTravel.Data;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;

namespace InTravel.Extension
{
    public static class DatabaseExtension
    {
        public static async void ExecuteDmlCommand(this Database db, string command)
        {
            var conn = db.Database.GetDbConnection();
            await conn.OpenAsync();
            var cmd = conn.CreateCommand();
            cmd.CommandText = command;
            await cmd.ExecuteNonQueryAsync();
            await cmd.DisposeAsync();
            await conn.CloseAsync();
        }

        public static async Task<List<List<dynamic>>> ExecuteDqlCommand(this Database db, string command)
        {
            var conn = db.Database.GetDbConnection();
            await conn.OpenAsync();
            var res = new List<List<dynamic>>();
            var cmd = conn.CreateCommand();
            cmd.CommandText = command;
            var reader = await cmd.ExecuteReaderAsync();
            while (await reader.ReadAsync())
            {
                res.Add(new List<dynamic>());
                for (int i = 0; i < reader.FieldCount; ++i)
                {
                    res.Last().Add(Convert.ChangeType(reader[i], reader[i].GetType()));
                }
            }
            await reader.DisposeAsync();
            return res;
        }
    }
}