package vortex.imwp.controller;


import vortex.imwp.Models.Item;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import vortex.imwp.Services.ItemService;
import vortex.imwp.Services.WarehouseService;

import java.util.List;

@Controller
public class InventoryController {

	WarehouseService warehouseService;
	ItemService itemService;
	public InventoryController(WarehouseService warehouseService, ItemService itemService) {
		this.warehouseService = warehouseService;
		this.itemService = itemService;
	}

	@GetMapping("/")
	public String home(Model model) {
		model.addAttribute("items", itemService.getAllItems());
		model.addAttribute("warehouses", warehouseService.getAllWarehouses());
		return "item/home";
	}

	@PostMapping("/add")
	public String addItem(@RequestParam String name,
						  @RequestParam String description,
						  @RequestParam double price,
						  @RequestParam Integer quantity,
						  @RequestParam(required = false) List<Long> warehouseIds) {
		Item item = new Item(name, description, price, quantity);
		if (warehouseIds != null) {
			for (Long wid : warehouseIds) {
				warehouseService.getWarehouseById(wid)
						.ifPresent(item::addWarehouse);
			}
		}
		itemService.addItem(item);
		return "redirect:/";
	}

}
