package vortex.imwp.Mappers;

import vortex.imwp.DTOs.SaleDTO;
import vortex.imwp.Models.Sale;

public class SaleDTOMapper {
    public static SaleDTO map(Sale sale){
        return new SaleDTO(
                sale.getSale_Time(),
                EmployeeDTOMapper.map(sale.getSalesman())
        );
    }
}
