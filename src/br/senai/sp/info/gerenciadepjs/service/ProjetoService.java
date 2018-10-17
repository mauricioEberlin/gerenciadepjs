package br.senai.sp.info.gerenciadepjs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.senai.sp.info.gerenciadepjs.dao.ProjetoDAO;
import br.senai.sp.info.gerenciadepjs.dao.TecnologiaDAO;
import br.senai.sp.info.gerenciadepjs.exceptions.EntidadeNaoEncontradaException;
import br.senai.sp.info.gerenciadepjs.model.Projeto;
import br.senai.sp.info.gerenciadepjs.model.Tecnologia;

@Service
public class ProjetoService {

	@Autowired
	private ProjetoDAO dao;
	
	@Autowired
	private TecnologiaDAO tecDao;
	
	public List<Projeto> buscarTodos(){
		return dao.buscarTodos();
	}
	
	public Projeto buscar(Long id) throws EntidadeNaoEncontradaException{
		Projeto p = dao.buscar(id);
		
		if(p == null) {
			throw new EntidadeNaoEncontradaException();
		}
		return p;
	}
	
	public List<Projeto> buscarPorTecnologia(Long idTecnologia) {		
		return dao.buscarPorTecnologia(idTecnologia);			
	}	
}
