require 'spec_helper'
require 'database'
require 'uffmail'
require 'aluno'
require 'yaml'

describe Database do

  context "When the Aluno is searched" do
    before do
      @matricula = "100"
      @aluno = Aluno.new("Gabriel Santos Ribeiro","100","9999-9950","email@gmail.com","","Ativo")
    end
    it "Responds Aluno = Gabriel Santos Ribeiro" do
      expect(Database.busca_aluno(@matricula)).to be_truthy
    end
  end

  context "When the uffmail already exists" do
    before do
      @suges = [] << "gsantos@id.uff.br"
    end
    it "Responds gsantos3@id.uff.br" do
      expect(Database.valida_sugestoes(@suges)).to eq(["gsantos3@id.uff.br"])
    end
  end

  context "When the Aluno is updated " do
    before do
      @uffmail_select = ["gsantos@id.uff.br"]
      @matricula = 100
    end
    it "Updates the Csv File" do
      expect(Database.update_aluno(@matricula, @uffmail_select)).to be_falsy    end
  end
end