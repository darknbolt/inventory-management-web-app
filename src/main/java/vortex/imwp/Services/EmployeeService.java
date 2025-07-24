package vortex.imwp.Services;

import org.springframework.stereotype.Service;
import vortex.imwp.DTOs.EmployeeDTO;
import vortex.imwp.Mappers.EmployeeDTOMapper;
import vortex.imwp.Repositories.EmployeeRepository;

import java.util.Optional;

@Service
public class EmployeeService {
    private final EmployeeRepository employeeRepository;
    public EmployeeService(EmployeeRepository employeeRepository) {
        this.employeeRepository = employeeRepository;
    }

    public Optional<EmployeeDTO> getEmployeeByUsername(String username) {
        return employeeRepository.findByUsername(username)
                .map(EmployeeDTOMapper::map);
    }
}
