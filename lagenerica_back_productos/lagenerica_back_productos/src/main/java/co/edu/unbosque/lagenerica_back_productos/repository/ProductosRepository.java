package co.edu.unbosque.lagenerica_back_productos.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import co.edu.unbosque.lagenerica_back_productos.model.Productos;

public interface ProductosRepository extends MongoRepository<Productos,Integer>{

}
