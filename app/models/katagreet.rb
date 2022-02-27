
class Tools

    def greet name
        
        if name.respond_to?(:each)
            "Hello " + to_sentence(name)
        else
            if name.nil?
                "Hello my friend"
            elsif is_upcase? name
                "HELLO " + name            
            else
                "Hello " + name
            end
        end

    end

    private 

    def is_upcase? name
        name == name.upcase
    end

    def to_sentence names
        
        group_up = Array.new
        group_down = Array.new

        names = split_names_containing_comma names

        names.each do |name|
            if is_upcase? name
                group_up.push name
            else
                group_down.push name
            end
        end

        sentence_down = to_beautifull_sentence group_down 
        sentence_up = to_beautifull_sentence group_up
        
        if group_up.any?
            sentence_down + ". AND HELLO " + sentence_up 
        else
            sentence_down
        end

    end

    def split_names_containing_comma names
        names_with_comma = Array.new

        names.each do |name|
            if name.include? ','
                names_with_comma.concat name.split(', ')
                names.delete name 
            end
        end

        names.concat names_with_comma
    end

    def to_beautifull_sentence names_group
        sentence = names_group.join ', '
        sentence = sentence.reverse.sub(",", "dna ").reverse 
    end
    
end