require 'spec_helper'
require 'uffmail'
require 'database'
require 'yaml'
 
describe Uffmail do
   context "When prepositions was removed" do
    before do
      @nome = "Ana de Faria dos Santos"
    end
    it "responds Ana Faria Santos" do
      expect(Uffmail.remove_preposicao(@nome)).to eq("Ana Faria Santos")
    end

  end
	context "When name with 2 words" do
    before do
      @nome = "joao silva"
    end
    it "responds with joao_silva" do
      expect(Uffmail.sugestao_um(@nome)).to eq("joao_silva")
    end
    it "responds with jsilva" do
      expect(Uffmail.sugestao_dois(@nome)).to eq("jsilva")
    end
    it "reponds with joaosilva" do
      expect(Uffmail.sugestao_tres(@nome)).to eq("joaosilva")
    end
=begin    it "reponds nil" do
      expect(Uffmail.sugestao_quatro(@nome)).to be_falsy
      expect(Uffmail.sugestao_cinco(@nome)).to be_falsy
   end
=end
  end
  context "When name with 3 words or more" do
    before do
      @nome = "joao silva abreu santos"
    end
    it "responds with joao_santos" do
      expect(Uffmail.sugestao_um(@nome)).to eq("joao_santos")
    end
    it "responds with jsilva" do
      expect(Uffmail.sugestao_dois(@nome)).to eq("jsilva")
    end
    it "reponds with joaosilva" do
      expect(Uffmail.sugestao_tres(@nome)).to eq("joaosilva")
    end
    it "reponds with joaosa" do
      expect(Uffmail.sugestao_quatro(@nome)).to eq("joaosa")
    end
    it "reponds with jsilvaabreu" do
      expect(Uffmail.sugestao_cinco(@nome)).to eq("jsilvaabreu")
    end
  end
  context "When the sugestions are generated " do
    before do
      @nome = "Joao Silva Abreu Santos"
    end
    it "responds 5 suggestions" do
       expect(Uffmail.gera_sugestoes(@nome)).to match_array(["jsilvaabreu@id.uff.br","joaosa@id.uff.br","jsilva@id.uff.br","joaosilva@id.uff.br","joao_santos@id.uff.br"])
    end
  end
end


