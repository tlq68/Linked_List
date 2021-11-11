class LinkedList
    attr_accessor :head, :tail

    def initialize(head = nil)
        @head = head
    end

    def append(value)
        if @head 
            tail.next_node = Node.new(value)
        else
            @head = Node.new(value)
        end
    end

    def prepend(value)
        node = @head
        @head = Node.new(value)
        head.next_node = node

    end

    def size
        size_count = 0
        node = @head

        while node != nil
            size_count += 1
            node = node.next_node
        end
        size_count
    end

    def head
        @head
    end

    def tail
        node = @head
        return node if !node.next_node
        return node if !node.next_node while (node = node.next_node)
    end

    def at(index)
        node = @head
        if index == 0
            node = @head
        else 
            index.times do 
                node = node.next_node
            end
        end
        node.value
    end

    def pop
        node = @head
        
        while (node.next_node != tail)
            node = node.next_node
        end
        node.next_node = nil
    end

    def contains?(value)
        node = @head 
        in_the_list = false

        self.size.times do |node|
            if self.at(node) == value 
                in_the_list = true
                break
            end
        end
        in_the_list
    end

    def find(value)
        node = @head
        index_counter = 0
        if self.contains?(value) == true
            until node.value == value 
                node = node.next_node
                index_counter += 1
            end
        else
            return "Value is not in linked list."
        end
        index_counter
    end

    def to_s
        node = @head
        node_string = " ( #{node.value} ) -> "
        (self.size-1).times do 
            node = node.next_node
            node_string += " ( #{node.value} ) "
            node_string += " -> " if node.next_node != nil
        end
        node_string
    end

    # Extra Credit
    def insert_t(value, index)

    end

    def remove_at(index)

    end


end

class Node
    attr_accessor :value, :next_node

    def initialize(value = nil, next_node = nil)
        @value = value
        @next_node = next_node
    end
end


arr = LinkedList.new

arr.append(3)
arr.append(33)
arr.append(44)

arr.prepend(1)
arr.prepend("Hello")

p arr.pop
p arr

p arr.contains?(3)
p arr.contains?(55)

p arr.find(3)
p arr.find('Hello')
p arr.find(234)


arr.append(1234)
arr.prepend("Beginning")
p arr.to_s
