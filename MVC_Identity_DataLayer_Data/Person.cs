﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
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
            public string Message;
        }

        public Person() : base()
        {

        }

        public List<PersonDetails> GetAllPerson()
        {

            SqlConnection conn = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SP_get_all_persons", conn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            SqlParameter outputParameter = new SqlParameter();
            outputParameter.ParameterName = "@PersonCount";
            outputParameter.SqlDbType = System.Data.SqlDbType.Int;
            outputParameter.Direction = System.Data.ParameterDirection.Output;
            cmd.Parameters.Add(outputParameter);

            SqlDataReader rdr;

            try
            {
                conn.Open();
                rdr = cmd.ExecuteReader();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                conn.Close();
            }


            List<PersonDetails> persons = new List<PersonDetails>();

            while (rdr.Read())
            {
                PersonDetails person = new PersonDetails();

                person.PersonID = Convert.ToInt32(rdr["PersonID"]);
                person.FirstName = Convert.ToString(rdr["FirstName"]);
                person.LastName = Convert.ToString(rdr["LastName"]);
                person.Age = Convert.ToInt32(rdr["Age"]);
                person.EmailID = Convert.ToString(rdr["EmailID"]);
                person.Gender = Convert.ToString(rdr["Gender"]);
                person.AddressID = Convert.ToInt32(rdr["AddressID"]);

                persons.Add(person);

            }


            return persons;

        }

        public PersonDetails GetPerson(int id)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SP_get_person", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@PersonID", id);

            conn.Open();

            SqlDataReader rdr = cmd.ExecuteReader();

            PersonDetails person = new PersonDetails();

            while (rdr.Read())
            {
                person.PersonID = Convert.ToInt32(rdr["PersonID"]);
                person.FirstName = Convert.ToString(rdr["FirstName"]);
                person.LastName = Convert.ToString(rdr["LastName"]);
                person.Age = Convert.ToInt32(rdr["Age"]);
                person.EmailID = Convert.ToString(rdr["EmailID"]);
                person.Gender = Convert.ToString(rdr["Gender"]);
                person.AddressID = Convert.ToInt32(rdr["AddressID"]);
            }

            return person;
        }


        public void InsertPerson(PersonDetails obj)
        {


            SqlConnection conn = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SP_insert_person", conn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;


            cmd.Parameters.AddWithValue("@FirstName", obj.FirstName);
            cmd.Parameters.AddWithValue("@LastName", obj.LastName);
            cmd.Parameters.AddWithValue("@Age", obj.Age);
            cmd.Parameters.AddWithValue("@EmailID", obj.EmailID);
            cmd.Parameters.AddWithValue("@Gender", obj.Gender);
            cmd.Parameters.AddWithValue("@AddressID", obj.AddressID);

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
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

        public void UpdatePerson(PersonDetails obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SP_update__person", conn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@PersonID", obj.PersonID);
            cmd.Parameters.AddWithValue("@FirstName", obj.FirstName);
            cmd.Parameters.AddWithValue("@LastName", obj.LastName);
            cmd.Parameters.AddWithValue("@Age", obj.Age);
            cmd.Parameters.AddWithValue("@EmailID", obj.EmailID);
            cmd.Parameters.AddWithValue("@Gender", obj.Gender);
            cmd.Parameters.AddWithValue("@AddressID", obj.AddressID);


            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
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