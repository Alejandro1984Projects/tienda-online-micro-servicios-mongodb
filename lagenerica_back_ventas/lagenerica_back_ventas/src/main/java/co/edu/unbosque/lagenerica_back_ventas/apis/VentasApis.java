package co.edu.unbosque.lagenerica_back_ventas.apis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import co.edu.unbosque.lagenerica_back_ventas.model.Ventas;
import co.edu.unbosque.lagenerica_back_ventas.repository.VentasRepository;

@RestController
@CrossOrigin
@RequestMapping("ventas")
public class VentasApis {
	@Autowired
	private VentasRepository ventasDAO;
	@PostMapping("/guardar")
	public void guardar(@RequestBody Ventas venta) {
		ventasDAO.save(venta);
	}
	@GetMapping("/listar")
	public List<Ventas> listar(){
	return ventasDAO.findAll();
	}
}
