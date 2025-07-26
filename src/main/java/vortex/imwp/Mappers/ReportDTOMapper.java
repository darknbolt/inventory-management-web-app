package vortex.imwp.Mappers;

import vortex.imwp.DTOs.ReportDTO;
import vortex.imwp.Models.Report;

public class ReportDTOMapper {
    public static ReportDTO map(Report report){
        return new ReportDTO(
                report.getType(),
                report.getEmployeeIdCreated(),
                report.getCreatedAtWarehouseID()
        );
    }
}
