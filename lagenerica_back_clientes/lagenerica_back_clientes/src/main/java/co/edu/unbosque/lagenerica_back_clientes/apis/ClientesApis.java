package co.edu.unbosque.lagenerica_back_clientes.apis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import co.edu.unbosque.lagenerica_back_clientes.model.Clientes;
import co.edu.unbosque.lagenerica_back_clientes.repository.ClientesRepository;

@RestController
@CrossOrigin
@RequestMapping("clientes")
public class ClientesApis {
	@Autowired
	private ClientesRepository clientesDAO;
	@PostMapping("/guardar")
	public void guardar(@RequestBody Clientes cliente) {
		clientesDAO.save(cliente);
	}
	@GetMapping("/listar")
	public List<Clientes> listar(){
	return clientesDAO.findAll();
	}
	@GetMapping("/buscarporID/{id}")
	public Clientes buscarporID(@PathVariable(value="id") Integer id){
		Clientes cliente=new Clientes();
		try {cliente=clientesDAO.findById(id).get();}
		catch(Exception e) {}
	return cliente;
	}
	@DeleteMapping("/eliminar/{id}")
	public void eliminar(@PathVariable(value="id") Integer id) {		
		clientesDAO.deleteById(id);
	}
	@PutMapping("/actualizar")
	public void actualizar(@RequestBody Clientes cliente) {
		clientesDAO.save(cliente);
	}

}
