using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Odbc;
using System.Data;
using CapaModelo;


namespace CapaControlador
{
    public class Controlador
    {
        Sentencias Modelo = new Sentencias();
        public DataTable llenarTblProveedores(string tabla)
        {
            OdbcDataAdapter dt = Modelo.llenarTblProveedores(tabla);
            DataTable table = new DataTable();
            dt.Fill(table);
            return table;
        }
        public DataTable llenarTblCompras_detalle(string tabla)
        {
            OdbcDataAdapter dt = Modelo.llenarTblProveedores(tabla);
            DataTable table = new DataTable();
            dt.Fill(table);
            return table;
        }
    }
}
