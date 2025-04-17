using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;

namespace WpfApp2
{
    public partial class EditPage : Page
    {
        MasterPolDBEntities entities = new MasterPolDBEntities();
        Partner partner = new Partner();
        public EditPage(int Id)
        {
            InitializeComponent();
            foreach(var entity in entities.Partner_type)
                Partner_type_ComboBox.Items.Add(entity);

            if (Id == 0)
                partner = new Partner();
            else 
                partner = entities.Partner.Find(Id);

            if(partner != null)
            {
                Partner_nameTextBox.Text = partner.Partner_name;
                Partner_type_ComboBox.SelectedItem = partner.Partner_type;
                Familia_directorTextBox.Text = partner.Familia_director;
                Name_directorTextBox.Text = partner.Name_director;
                Othestvo_directorTextBox.Text = partner.Othestvo_director;
                EmailTextBox.Text = partner.Email;
                TelephoneTextBox.Text = partner.Telephone;
                AdressTextBox.Text = partner.Adress;
                InnTextBox.Text = partner.Inn;
                ReitingTextBox.Text = partner.Reiting.ToString();
            }
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            if (Partner_nameTextBox.Text == "" || Partner_type_ComboBox.SelectedValue == null || Familia_directorTextBox.Text == "" ||
                Name_directorTextBox.Text == "" || Othestvo_directorTextBox.Text == "" || EmailTextBox.Text == "" ||
                TelephoneTextBox.Text == "" || AdressTextBox.Text == "" || InnTextBox.Text == "" || ReitingTextBox.Text == "")
            {
                MessageBox.Show("Заполните все поля!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (!int.TryParse(ReitingTextBox.Text, out int res))
            {
                MessageBox.Show("Рейтинг должен быть целым и не отрицательным!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            try
            {
                partner.Partner_name = Partner_nameTextBox.Text;
                partner.Partner_type = Partner_type_ComboBox.SelectedItem as Partner_type;
                partner.Familia_director = Familia_directorTextBox.Text;
                partner.Name_director = Name_directorTextBox.Text;
                partner.Othestvo_director = Othestvo_directorTextBox.Text;
                partner.Email = EmailTextBox.Text;
                partner.Inn = InnTextBox.Text;
                partner.Adress = AdressTextBox.Text;
                partner.Telephone = TelephoneTextBox.Text;
                partner.Reiting = int.Parse(ReitingTextBox.Text);

                if(partner.Id == 0)
                    entities.Partner.Add(partner);

                entities.SaveChanges();
                MessageBox.Show("Данные успешно сохранены!", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                NavigationService.Navigate(new ListPage());
            }
            catch (Exception ex) 
            {
                MessageBox.Show("Ошибка сохранения: " +ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new ListPage());

        }
    }
}
