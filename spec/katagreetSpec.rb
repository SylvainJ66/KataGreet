require 'rspec'
require_relative '../app/models/katagreet'

describe "greet kata" do
    
    it("can say hello to a personn with his name") do
        sentence = Tools.new.greet "Bob"
        expect(sentence).to eq("Hello Bob")
    end

    it("can say Hello my friend if no name") do
        sentence = Tools.new.greet nil
        expect(sentence).to eq("Hello my friend")
    end


    it("can say HELLO to a personn in uppercase") do
        sentence = Tools.new.greet "BOB"
        expect(sentence).to eq("HELLO BOB")
    end


    it("can say Hello to a group of personns") do
        sentence = Tools.new.greet ["Amy","Brian","Charlotte"]
        expect(sentence).to eq("Hello Amy, Brian and Charlotte")
    end


    it("can say Hello or HELLO to a group of personns") do
        sentence = Tools.new.greet ["Amy","BRIAN","Charlotte"]
        expect(sentence).to eq("Hello Amy and Charlotte. AND HELLO BRIAN")
    end

    it("can say Hello to a group of personns even if a name contains comma") do
        sentence = Tools.new.greet ["Amy","Charlie, Dianne"]
        expect(sentence).to eq("Hello Amy, Charlie and Dianne")
    end
end