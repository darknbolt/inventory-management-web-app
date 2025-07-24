package vortex.imwp.Services;

import vortex.imwp.Models.Item;
import vortex.imwp.Repositories.ItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ItemService {

	@Autowired
	private ItemRepository itemRepository;

	public List<Item> getAllItems() {
		return itemRepository.findAll();
	}

	public Optional<Item> getItemById(Long id) {
		return itemRepository.findById(id);
	}

	public Item addItem(Item item) {
		return itemRepository.save(item);
	}

	public Item updateItem(Item item) {
		return itemRepository.save(item);
	}

	public void deleteItem(Long id) {
		itemRepository.deleteById(id);
	}

	public List<Item> searchItems(String keyword) {
		return itemRepository.findByNameContainingIgnoreCase(keyword);
	}
}
