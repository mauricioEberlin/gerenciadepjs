package br.senai.sp.info.gerenciadepjs.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.beans.factory.annotation.Autowired;

@Entity
@Table
public class Projeto {

	@Id
	private Long id;
	
	@ManyToOne
	@JoinColumn(nullable = false, name = "usuario_id")
	private Usuario usuarioCriador;
	
	@ManyToOne
	@JoinColumn(nullable = false, name = "tecnologia_id")
	private Tecnologia tecnologia;
	
	@Column(length = 40, nullable = false, unique = false)
	@NotNull
	@Size(min = 1, max = 40)
	private String nome;
	
	@Column(length = 64, nullable = false, unique = false)
	@NotNull
	@Size(min = 1, max = 64)
	private String responsavelBRQ;
	
	@Column(length = 64, nullable = false, unique = false)
	@NotNull
	@Size(min = 1, max = 64)
	private String responsavelCliente;
	
	@Column(nullable = true)
	private Float horas;
	
	@Column(nullable = true)
	private Date dataInicio;
	
	@Column(nullable = true)
	private Date dataFim;
	
	@Lob
	@Column(length = 500, nullable = true)
	@Size(max = 500)
	private String descricao;
	
	@NotNull
	private Status status = Status.INICIADO;
	
	//G&S
	
	public Tecnologia getTecnologia() {
		return tecnologia;
	}

	public void setTecnologia(Tecnologia tecnologia) {
		this.tecnologia = tecnologia;
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Usuario getUsuarioCriador() {
		return usuarioCriador;
	}

	public void setUsuarioCriador(Usuario usuarioCriador) {
		this.usuarioCriador = usuarioCriador;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getResponsavelBRQ() {
		return responsavelBRQ;
	}

	public void setResponsavelBRQ(String responsavelBRQ) {
		this.responsavelBRQ = responsavelBRQ;
	}

	public String getResponsavelCliente() {
		return responsavelCliente;
	}

	public void setResponsavelCliente(String responsavelCliente) {
		this.responsavelCliente = responsavelCliente;
	}

	public Float getHoras() {
		return horas;
	}

	public void setHoras(Float horas) {
		this.horas = horas;
	}

	public Date getDataInicio() {
		return dataInicio;
	}

	public void setDataInicio(Date dataInicio) {
		this.dataInicio = dataInicio;
	}

	public Date getDataFim() {
		return dataFim;
	}

	public void setDataFim(Date dataFim) {
		this.dataFim = dataFim;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}	
}
