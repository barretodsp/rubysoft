require 'spec_helper'
require 'aluno'
require 'yaml'
 
describe Aluno do
    before do
      @aluno = Aluno.new("João",
                         "22222",
                         "9999-1111",
                         "mail@mail.com",
                         "",
                         "Inativo"
                        )
    end
    it "valor de retorno metodo ativo" do
      expect(@aluno.ativo?).to be false
    end

end


