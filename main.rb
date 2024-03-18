class Node
    attr_accessor :value, :next_node

    def initialize(value)
        @value = value
        @next_node = nil
    end
end

class LinkedList
    attr_accessor :head

    def initialize
        @head = nil
    end

    def append(value)
        # adds a new node containing value to the end of the list
        if @head.nil?
            @head = Node.new(value)
        else
            current = @head
            while current.next_node != nil
                current = current.next_node
            end
            current.next_node = Node.new(value)
        end
    end

    def append_multiple(values)
        #appending multiple values at once
        values.each {|val| append(val)}
    end

    def prepend(value)
        #adds a new node containing value to the start of the list
        new_node = Node.new(value)
        new_node.next_node = @head
        @head = new_node
    end

    def size
        #returns the total number of nodes in the list
        count = 0
        current = @head
        while current != nil
            count += 1
            current = current.next_node
        end
        count
    end

    def head
        #returns the first node in the list
        @head
    end

    def tail
        #returns the last node in the list
        current = @head
        return current if current.nil? || current.next_node.nil?
        current = current.next_node while current.next_node != nil
        current
    end

    def at(index)
        #eturns the node at the given index
        current = @head
        idx = 0
        while current != nil
            return current.value if idx == index
            current = current.next_node
            idx += 1
        end
        nil
    end

    def pop
        #removes the last element from the list
        return nil if @head.nil?
        if @head.next_node.nil?
            value = @head.value
            @head = nil
            return value
        end
        current = @head
        while current.next_node.next_node != nil
            current = current.next_node
        end
        value = current.next_node.value
        current.next_node = nil
        value
    end

    def contains?(value)
        #returns true if the passed in value is in the list and otherwise returns false
        current = @head
        while current != nil
            return true if current.value == value
            current = current.next_node
        end
        false
    end

    def find(value)
        #returns the index of the node containing value, or nil if not found
        current = @head
        idx = 0
        while current != nil
            return idx if current.value == value
            current = current.next_node
            idx += 1
        end
        nil
    end

    def to_s
        #represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil
        current = @head
        while current != nil
            print "#{current.value} -> "
            current = current.next_node
        end
        print "nil\n"
    end

    
    # def insert_at(value, index)
    #     #inserts a new node with the provided value at the given index
    #     if index == 0 
    #         prepend(value)
    #     else
    #         prev_node = at(index - 1)

    #         return nil if prev_node.nil? #Index out of bounds
    #         new_node = Node.new(value)
    #         new_node.next_node = prev_node.next_node
    #         prev_node.next_node = new_node
    #     end
    # end

    # def remove_at(index)
    #     #removes the node at the given index
    #     return nil if @head.nil? || index < 0
    #     removed_value = nil
    #     if index == 0
    #         removed_value = @head.value
    #         @head = @head.next_node
    #     else
    #         prev_node = at(index - 1)
    #         return nil if prev_node.nil? || prev_node.next_node.nil?

    #         removed_value = prev_node.next_node.value
    #         prev_node.next_node = prev_node.next_node.next_node
    #     end
    #     @size -= 1
    #     return removed_value
    # end


end

#TESTING
mList = LinkedList.new
mList.append(1)
mList.append_multiple([3,4,5]) 
mList.append(8)
mList.prepend(2)
# mList.insert_at(2,9)
# mList.remove_at(1)

puts "List: #{mList}"
puts "Head: #{mList.head.value}"
puts "Tail: #{mList.tail.value}"
puts "Size of list: #{mList.size}"
puts "Element at index 2: #{mList.at(2)}"
puts "Element at index 3: #{mList.at(3)}"
puts "Popped element: #{mList.pop}"
puts "List after popping: #{mList}"
puts "Does list contain 7? #{mList.contains?(7)}"
puts "Does list contain 3? #{mList.contains?(3)}"
puts "Index of value 5: #{mList.find(5)}"
puts "Index of value 12: #{mList.find(12)}"