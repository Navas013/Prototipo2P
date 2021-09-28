using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CapaVista.Mantenimientos
{
    public partial class frmMDI : Form
    {
        public frmMDI()
        {
            InitializeComponent();
        }

        private void mantenimiento1ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Mantenimientos.frmMantenimientoCompras mante = new Mantenimientos.frmMantenimientoCompras();
            mante.Show();
        }

        private void mantenimiento2ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Mantenimientos.frmMantenimientoProveedores mante = new Mantenimientos.frmMantenimientoProveedores();
            mante.Show();
        }
    }
}
