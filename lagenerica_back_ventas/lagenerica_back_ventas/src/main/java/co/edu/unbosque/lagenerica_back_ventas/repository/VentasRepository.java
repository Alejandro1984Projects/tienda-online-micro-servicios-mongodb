package co.edu.unbosque.lagenerica_back_ventas.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import co.edu.unbosque.lagenerica_back_ventas.model.Ventas;

public interface VentasRepository extends MongoRepository<Ventas,Integer>{

}
