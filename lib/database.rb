require 'csv'
require_relative 'aluno'
class Database
	@head
	def self.valida_sugestoes(sugestoes)
		CSV.foreach('alunos.csv', headers: true) do |row|
			linha = row.to_hash
			sugestoes.each_with_index do |uffmail, index|
				if linha["uffmail"] == uffmail
					snome = linha["uffmail"].split("@")
					sugestoes[index] = snome[0] << "3" << "@id.uff.br"
					return sugestoes
				end
			end
		end
	end
	def self.busca_aluno(matricula)
 		CSV.foreach('alunos.csv', headers: true) do |row|
  		linha = row.to_hash
			@head = linha.keys
			if linha["matricula"] == matricula
				aluno = Aluno.new(linha["nome"], linha["matricula"], linha["telefone"], linha["email"], linha["uffmail"], linha["status"])
		    return aluno
			end
		end
		return nil
  end
  def self.update_aluno(matricula, uffmail_selecionado)
		CSV.open('atualizado.csv', 'w', headers: @head, write_headers: true, return_headers: true ) do |csv_out|
			CSV.foreach('alunos.csv', headers: true) do |row|
				linha = row.to_hash
   			linha["uffmail"] = uffmail_selecionado if linha["matricula"] == matricula
				csv_out << linha.values
			end
		end
  end
end
