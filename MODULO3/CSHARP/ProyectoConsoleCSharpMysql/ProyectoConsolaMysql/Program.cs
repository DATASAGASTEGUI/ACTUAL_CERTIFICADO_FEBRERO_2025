using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProyectoConsolaMysql;

internal class Program
{
    static void Main(string[] args)
    {
        try
        {
            string server = "localhost";
            string database = "factoria";
            string uid = "root";
            string password = "12345678";
            int port = 3307; // Puerto MySQL predeterminado

            string connectionString = $"Server={server};Port={port};Database={database};Uid={uid};Pwd={password};";

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT * FROM Cliente";
                using (MySqlCommand command = new MySqlCommand(query, connection)) //
                {

                    using (MySqlDataReader reader = command.ExecuteReader())
                    {

                        while (reader.Read())
                        {
                            Console.WriteLine(reader.GetInt32(0) + " "
                                + reader.GetString(1));
                            
                        }

                    }
                }
            }
        }
        catch (MySqlException e)
        {
            Console.WriteLine("ERROR: \n" + e.Message);
        }



    }
}

