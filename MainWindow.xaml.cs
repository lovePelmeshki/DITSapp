using System;
using System.Collections.Generic;
using System.Data.Entity;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace DITSapp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
  
        public MainWindow()
        {
            InitializeComponent();
            _renewControl();
        }

        private void _renewControl()
        {
            using (workEntities1 db = new workEntities1())
            {
                List<string> posName = new List<string>();
                foreach (var pos in db.PositionSet)
                {
                    posName.Add(pos.Name);
                }
                comboBox.ItemsSource = posName;
                dataGrid.ItemsSource = db.Employee.ToList();


            }
        }

        private void button_Click(object sender, RoutedEventArgs e)
        {
            using (workEntities1 db = new workEntities1())
            {
                db.Employee.Add(new Employee()
                {                   
                    SecondName = textBox_SecondName.Text,
                    Name = textBox_Name.Text,
                    Login = textBox_Login.Text,
                    Password = passwordBox.Password,
                    PositionId = comboBox.SelectedIndex+1
                }).ToString();
                    db.SaveChanges();


               
            }
            _renewControl();
        }


        private void search_texbox_TextChanged(object sender, TextChangedEventArgs e)
        {
            using (workEntities1 db = new workEntities1())
            {
                if (search_texbox.Text.Equals(""))
                {
                    _renewControl();
                }
                else
                {
                    var employees = from emp in db.Employee
                                    where emp.Name.ToLower().Contains(search_texbox.Text.ToLower())
                                    || emp.SecondName.ToLower().Contains(search_texbox.Text.ToLower())
                                    select emp;

                    dataGrid.ItemsSource = employees.ToList();
                }
            }

           

        }

        private void button_Delete_Click(object sender, RoutedEventArgs e)
        {
            using (workEntities1 db = new workEntities1())
            {

                int id = (dataGrid.SelectedItem as Employee).Id;
                var deleteUser = db.Employee.Where(u => u.Id == id).Single();
                if (deleteUser.Name == null)
                {

                }
                db.Employee.Remove(deleteUser);
                db.SaveChanges();
            }
            _renewControl();

        }

        private void button1_Click(object sender, RoutedEventArgs e)
        {
            VeryMainWindow veryMainWindow = new VeryMainWindow();
            veryMainWindow.Show();
        }
    }
}
