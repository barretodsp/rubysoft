require_relative 'database'

class Uffmail
	def self.gera_sugestoes(name)
	  sugestoes = []
		name.downcase!
		nome =Uffmail.remove_preposicao(name)
		sugestoes << Uffmail.sugestao_um(nome)
		sugestoes << Uffmail.sugestao_dois(nome)
		sugestoes << Uffmail.sugestao_tres(nome)
		sugestoes << Uffmail.sugestao_quatro(nome)
		sugestoes << Uffmail.sugestao_cinco(nome)
		sugestoes.each {|uffalias| uffalias << "@id.uff.br"}
		#Database.valida_sugestoes(sugestoes)
		sugestoes
	end
	def self.sugestao_um(nome)
  	snome = nome.split
  	(snome[0] << "_" << snome[-1])
  end

	def self.sugestao_dois(nome)
		snome = nome.split
 		snome[0][0] << snome[1]
  end

	def self.sugestao_tres(nome)
		snome = nome.split
		snome[0] << snome[1]
  end
  
	def self.sugestao_quatro(nome)
		snome = nome.split
		snome[0] << snome[1][0] << snome[2][0]
	end

  def self.sugestao_cinco(nome)
		snome = nome.split
		snome[0][0] << snome[1] << snome[2]
	end

	def self.remove_preposicao(nome)
		snome = nome.split
	  ["dos","das","do","da","de"].each do |prep|
			snome.delete(prep)
		end
		snome.join(" ")
	end
end
