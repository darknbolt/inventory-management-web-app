package vortex.imwp.Models;

import jakarta.persistence.*;

import java.security.Timestamp;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Sale {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "Sale_Time")
    private Timestamp sale_Time;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "ID", nullable = false)
    private Employee salesman;

    @OneToMany(mappedBy = "sale", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<SaleItem> saleItems = new HashSet<>();

    public Sale(){}
    public Sale(Timestamp sale_Time, Employee salesman) {
        this.sale_Time = sale_Time;
        this.salesman = salesman;
    }

}
