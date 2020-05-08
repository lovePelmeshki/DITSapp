using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace DITSapp
{
    /// <summary>
    /// Interaction logic for VeryMainWindow.xaml
    /// </summary>
    public partial class VeryMainWindow : Window
    {
        public VeryMainWindow()
        {
            InitializeComponent();
        }

        private void ListViewItem_Selected(object sender, RoutedEventArgs e)
        {
            using (workEntities1 db = new workEntities1())
            {
                //var emp = 
                GlobalDataGrid.ItemsSource = db.Employee.ToList();
            }
        }
    }
}
