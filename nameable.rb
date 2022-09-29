class Nameable
    def correct_name
        raise NotImplementedError, "subclass did not define #create"
    end
end
