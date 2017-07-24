require_relative 'aluno'
require_relative 'database'  
require_relative 'uffmail' 
require_relative 'mensagem' 

class Main
	def self.start
		aluno = solicita_aluno
		apto_a_uffmail?(aluno) && gera_uffmail(aluno)
	end

	private

	def self.solicita_aluno
		Mensagem.boas_vindas
		Database.busca_aluno(gets.chomp)
	end
  
	def self.gera_uffmail(aluno)
		uffmail_selecionado = usuario_escolhe_sugestao(Uffmail.gera_sugestoes(aluno.nome))
		finaliza_cadastro(aluno, uffmail_selecionado)		
	end
	
	def self.usuario_escolhe_sugestao(sugestoes)
		Mensagem.seleciona_uffmail_desejado(sugestoes)
		escolha = gets.chomp.to_i
		while (escolha < 1 || escolha > sugestoes.length)
 			Mensagem.escolha_incorreta(sugestoes.length)
			escolha = gets.chomp.to_i
 		end	
		sugestoes[escolha-1]
	end

	def self.finaliza_cadastro(aluno, uffmail_selecionado)
		Database.update_aluno(aluno.matricula, uffmail_selecionado)
		Mensagem.aviso_cadastro(uffmail_selecionado)
	  Mensagem.envio_sms(aluno.telefone)
	end
  def self.apto_a_uffmail?(aluno)
    existe?(aluno) && ativo?(aluno) && sem_uffmail?(aluno)
	end
  def self.existe?(aluno)
		  aluno
  end
  def self.ativo?(aluno)
		aluno.ativo?
  end
  def self.sem_uffmail?(aluno)
	  !aluno.uffmail
  end
end

Main.start
