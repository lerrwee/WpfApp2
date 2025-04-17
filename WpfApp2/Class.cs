using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfApp2
{
    partial class Partner
    {
        MasterPolDBEntities entities = new MasterPolDBEntities();
        public string Discont
        {
            get 
            {
                int discont = 0;
                var totalQ = entities.Partner_products.Where(p => p.Partner_id == Id).Sum(p => (int?)p.Kolvo) ?? 0;
                if (totalQ < 10000)
                    discont = 0;
                else if (totalQ >= 5000 && totalQ < 50000)
                    discont = 5;
                else if (totalQ >= 50000 && totalQ < 300000)
                    discont = 10;
                else if (totalQ >= 300000)
                    discont = 15;

                return $"{discont}%";
            }
        }
        public string Named
        {
            get
            {
                return $"{Partner_type.Partner_type1} | {Partner_name}";
            }
        }
        public string FIO
        {
            get
            {
                return $"{Familia_director} {Name_director} {Othestvo_director}";
            }
        }
        public string Rey
        {
            get
            {
                return $"Рейтинг: {Reiting}";
            }
        }
    }

    partial class Partner_products
    {
        public string NamedProd
        {
            get
            {
                return $"{Product.Name_product}";
            }
        }
        public string Kolvos
        {
            get
            {
                return $"Количество: {Kolvo}";
            }
        }
        public string Data
        {
            get
            {
                return $"Дата продажи: {Data_prodaz}";
            }
        }       
    }

    partial class Partner_type
    {
        public override string ToString()
        {
            return Partner_type1;
        }
    }

}
