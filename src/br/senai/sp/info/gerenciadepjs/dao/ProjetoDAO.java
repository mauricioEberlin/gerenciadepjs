package br.senai.sp.info.gerenciadepjs.dao;

import java.util.List;

import br.senai.sp.info.gerenciadepjs.model.Projeto;
import br.senai.sp.info.gerenciadepjs.model.Status;
import br.senai.sp.info.gerenciadepjs.model.Tecnologia;

public interface ProjetoDAO {

	public void persistir(Projeto obj);
	
	public void deletar(Projeto obj);
	
	public void alterar(Projeto obj);
	
	public List<Projeto> buscarTodos();
	
	public Projeto buscar(Long id);
	
	public Projeto buscarPorNome(String nome);

	public List<Projeto> buscarPorTecnologia(Long id);
	
	public List<Projeto> buscarPorStatus(Status status);

	public List<Projeto> pesquisarPorNome(String nome);
	
}
