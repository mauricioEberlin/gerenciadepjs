package br.senai.sp.info.gerenciadepjs.controller;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.SessionAttribute;

import br.senai.sp.info.gerenciadepjs.dao.UsuarioDAO;
import br.senai.sp.info.gerenciadepjs.model.Permissao;
import br.senai.sp.info.gerenciadepjs.model.Usuario;
import br.senai.sp.info.gerenciadepjs.utils.EmailUtils;
import br.senai.sp.info.gerenciadepjs.utils.SessionUtils;

@Controller
public class UsuarioController {

	@Autowired
	private SessionUtils sessionUtils;

	@Autowired
	private UsuarioDAO usuarioDAO;

	@GetMapping(value = { "/", "", "/index" })
	public String AbrirLogin(Model model) {
		model.addAttribute("usuario", new Usuario());
		return "index";
	}

	@GetMapping(value = { "/esqueciasenha" })
	public String AbrirEsqueciSenha(Model model) {
		model.addAttribute("usuario", new Usuario());
		return "forgotPass";
	}

	@PostMapping(value = { "/usuario/enviarsenha" })
	public String EnviarSenhaParaEmail(@ModelAttribute("usuario") Usuario usuario, BindingResult brUsuario) {

		if (usuarioDAO.buscarPorEmail(usuario.getEmail()) == null) {
			brUsuario.addError(
					new FieldError(usuario.getEmail(), usuario.getEmail(), "Este email nao existe em nosso sistema"));
		}

		if (brUsuario.hasErrors()) {
			System.out.println(brUsuario.getAllErrors());
			return "forgotpass";
		}

		String senhaNova = "123456";

		String titulo = "BQR - recuperação de senha";
		String corpo = "Olá, " + usuario.getEmail() + "! Recupere sua senha. <br>" + "A nova senha é " + senhaNova;

		try {
			EmailUtils.enviarEmail(titulo, corpo, usuario.getEmail());
		} catch (MessagingException e){
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/";
	}

	@PostMapping({ "/usuario/autenticar" })
	public String autenticar(@Valid @ModelAttribute("usuario") Usuario usuario, BindingResult br, HttpSession session) {
		usuario.hashearSenha();

		Usuario usuarioBuscado = usuarioDAO.buscarPorEmailESenha(usuario.getEmail(), usuario.getSenha());
		if (usuarioBuscado == null) {
			br.addError(new FieldError("usuario", "email", "E-mail ou senha incorretos"));
			return "redirect:/";
		}

		if (br.hasFieldErrors("email") || br.hasFieldErrors("senha")) {
			System.out.println("ERRO DE AUTENTICAÇÃO: " + br);
			return "index";
		}

		session.setAttribute("usuarioAutenticado", usuarioBuscado);
		return "redirect:/app/tecnologia";
	}

	@GetMapping("/app/usuario/editar")
	public String FormEditarUsuario(@SessionAttribute(name = "usuarioAutenticado") Usuario usuario,
			@RequestParam(name = "id", required = true) Long id,
			Model model){
			
		if(id != usuario.getId()) {
			return "redirect:/app/tecnologia";
		}
		model.addAttribute("usuario", usuarioDAO.buscar(id));
		return "usuario/userform";
	}

	@PostMapping(value = {"/app/usuario/salvar"})
	public String salvarAlteracao(@ModelAttribute("usuario") Usuario usuario, BindingResult brUsuario,
			@RequestParam(name = "senhaNova", required = false)String senhaNova) {
				
		Usuario usuarioBanco = usuarioDAO.buscar(usuario.getId());
		usuario.hashearSenha();
					
		if (!usuario.getSenha().equals(usuarioBanco.getSenha())) {
			brUsuario.addError(new FieldError("usuario", "senha", "A senha nao coincide com a senha antiga"));
		}
		
		if (brUsuario.hasErrors()) {
			System.out.println(brUsuario.getAllErrors());
			return "usuario/userform";
		}		
		
		if(senhaNova.length() >= 1) {
		usuarioBanco.setSenha(senhaNova);
		usuarioBanco.hashearSenha();
		}
		
		usuarioBanco.setNome(usuario.getNome());
		usuarioBanco.setSobrenome(usuario.getSobrenome());
		usuarioBanco.setCargo(usuario.getCargo());
		usuarioBanco.setTelefone(usuario.getTelefone());
					
		usuarioDAO.alterar(usuarioBanco);
				
		return "redirect:/app/tecnologia";
	}

	@GetMapping("/app/adm/usuario/novo")
	public String FormNovoUsuario(@RequestParam(name = "id", required = false) Long id, Model model) {
		if (id != null) {
			model.addAttribute("usuario", usuarioDAO.buscar(id));
		} else {
			model.addAttribute("usuario", new Usuario());
		}
		return "usuario/form";
	}

	@PostMapping(value = { "/app/adm/usuario/salvar" })
	public String salvar(@Valid @ModelAttribute("usuario") Usuario usuario, BindingResult brUsuario,
			@RequestParam(name = "tipoPermissao", required = false) String seraAdm) {

		if (usuarioDAO.buscarPorEmail(usuario.getEmail()) != null) {
			brUsuario.addError(new FieldError("usuario", "email", "O e-mail ja existe"));
		}
		if (brUsuario.hasErrors()) {
			System.out.println(brUsuario.hasErrors());
			return "usuario/form";
		}

		if (seraAdm.equals("verdadeiro")) {
			usuario.setPermissao(Permissao.ADMINISTRADOR);
		} else {
			usuario.setPermissao(Permissao.COORDENADOR);
		}

		if (usuario.getId() == null) {
			usuario.hashearSenha();
			usuarioDAO.persistir(usuario);

			/*
			 * String titulo = "Bem-Vindo a BQR"; String corpo = "Olá, " + usuario.getNome()
			 * + "! Seja bem-vindo a BRQ. ";
			 * //+"Acesse o link: localhost:8080/jc/ para realizar o login.";
			 * 
			 * try { EmailUtils.enviarEmail(titulo, corpo, usuario.getEmail()); }catch
			 * (MessagingException e) { e.printStackTrace(); }
			 */

		} else {
			Usuario usuarioBanco = usuarioDAO.buscar(usuario.getId());
			usuarioBanco.setNome(usuario.getNome());
			usuarioBanco.setSobrenome(usuario.getSobrenome());
			usuarioBanco.setPermissao(usuario.getPermissao());

			usuarioDAO.alterar(usuarioBanco);
		}
		return "redirect:/app/tecnologia";
	}

	@GetMapping({ "/sair" })
	public String logout() {
		sessionUtils.invalidarSessao();
		return "redirect:/";
	}
}
