//------------------------------------------------------------------------------
// <auto-generated>
//    Этот код был создан из шаблона.
//
//    Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//    Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WpfApp2
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product
    {
        public Product()
        {
            this.Material_type_Product = new HashSet<Material_type_Product>();
            this.Partner_products = new HashSet<Partner_products>();
        }
    
        public int Id { get; set; }
        public int Product_type_id { get; set; }
        public string Name_product { get; set; }
        public string Articul { get; set; }
        public double Min_stoumost { get; set; }
    
        public virtual ICollection<Material_type_Product> Material_type_Product { get; set; }
        public virtual ICollection<Partner_products> Partner_products { get; set; }
        public virtual Product_type Product_type { get; set; }
    }
}
