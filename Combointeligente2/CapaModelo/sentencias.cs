using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Odbc;
using System.Data;

namespace CapaModelo
{
    public class Sentencias
    {
        Conexion cn = new Conexion();
        OdbcCommand Comm;

        private DataTable tabla;

        public OdbcDataAdapter llenarTblProveedores(string tabla)
        {
            string sql = "call ConsultaProveedores();";
            OdbcDataAdapter dataTable = new OdbcDataAdapter(sql, cn.conexion());
            return dataTable; 

        }

        public OdbcDataAdapter llenarTblCompras_detalle(string tabla)
        {
            string sql = "call ConsultaCompras_detalle();";
            OdbcDataAdapter dataTable = new OdbcDataAdapter(sql, cn.conexion());
            return dataTable;

        }
    }

}
