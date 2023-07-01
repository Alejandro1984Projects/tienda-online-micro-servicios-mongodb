package co.edu.unbosque.lagenerica_back_clientes.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import co.edu.unbosque.lagenerica_back_clientes.model.Clientes;

public interface ClientesRepository extends MongoRepository<Clientes,Integer>{

}
