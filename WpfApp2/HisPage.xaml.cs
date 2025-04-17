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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace WpfApp2
{
    public partial class HisPage : Page
    {
        MasterPolDBEntities entities = new MasterPolDBEntities();
        public HisPage(Partner partner)
        {
            InitializeComponent();
            foreach(var entity in entities.Partner_products)
                LV.Items.Add(entity);

            NameTB.Text = $"История реализации продукции партнером: {partner.Partner_name}";
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
