import com.dao.ProductDao;
import com.model.Product;
import com.service.ConnectionProvider;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class ProductDaoTest {
    //Junit 5 testing
    @Test
    void addItem()
    {
        ProductDao p = new ProductDao(ConnectionProvider.getConnection());
        Product p1 = new Product();
        p1.setPname("Samsung Note 20");
        p1.setPdesc("Samsung Latest Phone");
        p1.setPrice(45000);
        p1.setCategory("Mobiles");
        p1.setDiscount_percent(0);
        p1.setAvailable_quantity(75);
        p1.setPimage("Note20Image");
        assertTrue(p.AddItem(p1));
    }

    @Test
    void updateItem() {
        ProductDao p = new ProductDao(ConnectionProvider.getConnection());
        Product p2 = new Product();
        p2.setId(1119);
        p2.setPname("Samsung Note 20 Ultra");
        p2.setPdesc("Samsung Latest Phone in the world");
        p2.setPrice(55000);
        p2.setCategory("Electronics");
        p2.setDiscount_percent(0);
        p2.setAvailable_quantity(30);
        assertTrue(p.UpdateItem(p2));
    }

    @Test
    void removeItem() {
        ProductDao p = new ProductDao(ConnectionProvider.getConnection());
        Product p3 = new Product();
        p3.setPname("Samsung Note 20 Ultra");
        assertTrue(p.RemoveItem(p3));
    }
}