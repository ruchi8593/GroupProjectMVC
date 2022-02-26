using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MVC_Identity_DataLayer_Data
{
    public class Person : DataObject
    {
        public class PersonDetails
        {
            public int PersonID;
            public string FirstName;
            public string LastName;
            public int Age;
            public string EmailID;
            public string Gender;
            public int AddressID;
        }

        public Person():base()
        {

        }

        public PersonDetails GetAllPerson()
        {

            SqlConnection conn = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SP_get_all_persons", conn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            SqlParameter outputParameter = new SqlParameter();
            outputParameter.ParameterName = "@PersonCount";
            outputParameter.SqlDbType = System.Data.SqlDbType.Int;
            outputParameter.Direction = System.Data.ParameterDirection.Output;
            cmd.Parameters.Add(outputParameter);

            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();

            try
            {
                da.Fill(ds);
                cmd.ExecuteNonQuery();

                lblMessess1.Text = "Total number of people in the database is" + " " + outputParameter.Value.ToString() + ".";


            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                conn.Close();
            }


            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                PersonDetails personDetails = new PersonDetails
                {
                    PersonID = Convert.ToInt32(dr["PersonID"]),
                    FirstName = dr["FirstName"].ToString(),
                    LastName = dr["FirstName"].ToString(),
                    Age = Convert.ToInt32(dr["Age"]),
                    EmailID = dr["EmailID"].ToString(),
                    Gender = dr["Gender"].ToString(),
                    AddressID = Convert.ToInt32(dr["AddressID"])
                };
                
            }

            return new PersonDetails();

        }
        
        

        public void InsertPerson()
        {
            // To run this query with output paramter, create a stored procedure with PersonID as output parameter

            SqlConnection conn = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SP_insert_person", conn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            //////to be edited 
            cmd.Parameters.AddWithValue("@FirstName", id);
            cmd.Parameters.AddWithValue("@LastName", id);
            cmd.Parameters.AddWithValue("@Age", id);
            cmd.Parameters.AddWithValue("@EmailID", id);
            cmd.Parameters.AddWithValue("@Gender", id);
            cmd.Parameters.AddWithValue("@AddressID", id);


            SqlParameter outputParameter = new SqlParameter();
            outputParameter.ParameterName = "@PersonID";
            outputParameter.SqlDbType = System.Data.SqlDbType.Int;
            outputParameter.Direction = System.Data.ParameterDirection.Output;
            cmd.Parameters.Add(outputParameter);
           

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                lblMessess.Text = "ID of a new person inserted is" + " " + outputParameter.Value.ToString() + ".";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }

        public void DeletePerson(int id)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SP_delete__person", conn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@PersonID", id);

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                lblMessess.Text = "Person deleted";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }

        public void UpdatePerson(int id)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SP_update__person", conn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            //////to be edited 
            cmd.Parameters.AddWithValue("@PersonID", id);
            cmd.Parameters.AddWithValue("@FirstName", id);
            cmd.Parameters.AddWithValue("@LastName", id);
            cmd.Parameters.AddWithValue("@Age", id);
            cmd.Parameters.AddWithValue("@EmailID", id);
            cmd.Parameters.AddWithValue("@Gender", id);
            cmd.Parameters.AddWithValue("@AddressID", id);
     /////////////////

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                lblMessess.Text = "Person Updated";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }
    }
}