package co.edu.unbosque.lagenerica_back_productos.apis;
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

import co.edu.unbosque.lagenerica_back_productos.model.Productos;
import co.edu.unbosque.lagenerica_back_productos.repository.ProductosRepository;


@RestController
@CrossOrigin
@RequestMapping("productos")

public class ProductosApis {
			
		@Autowired
		private ProductosRepository productosDAO;
		
		@PostMapping("/guardar")
		public void guardar(@RequestBody Productos producto) {
			productosDAO.save(producto);
		}
		@GetMapping("/listar")
		public List<Productos> listar(){
		return productosDAO.findAll();
		}
		@GetMapping("/buscarporID/{id}")
		public Productos buscarporId(@PathVariable(value="id") Integer id){
			Productos producto=new Productos();
			try {producto=productosDAO.findById(id).get();}
			catch(Exception e) {}
		return producto;
		}
		@DeleteMapping("/eliminar/{id}")
		public void eliminar(@PathVariable(value="id") Integer id) {		
			productosDAO.deleteById(id);
		}
		@DeleteMapping("/eliminarTodos")
		public void eliminarTodos() {
			productosDAO.deleteAll();
		}
		@PutMapping("/actualizar")
		public void actualizar(@RequestBody Productos producto) {
			productosDAO.save(producto);
		}

	

}
