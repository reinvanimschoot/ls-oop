=begin

A circular queue is a collection of objects stored in a buffer that is treated as though it is connected end-to-end in a circle. When an object is added to this circular queue, it is added to the position that immediately follows the most recently added object, while removing an object always removes the object that has been in the queue the longest.

This works as long as there are empty spots in the buffer. If the buffer becomes full, adding a new object to the queue requires getting rid of an existing object; with a circular queue, the object that has been in the queue the longest is discarded and replaced by the new object.

Assuming we have a circular queue with room for 3 objects, the circular queue looks and acts like this:
P1 	P2 	P3 	Comments
			All positions are initially empty
1 			Add 1 to the queue
1 	2 		Add 2 to the queue
	2 		Remove oldest item from the queue (1)
	2 	3 	Add 3 to the queue
4 	2 	3 	Add 4 to the queue, queue is now full
4 		3 	Remove oldest item from the queue (2)
4 	5 	3 	Add 5 to the queue, queue is full again
4 	5 	6 	Add 6 to the queue, replaces oldest element (3)
7 	5 	6 	Add 7 to the queue, replaces oldest element (4)
7 		6 	Remove oldest item from the queue (5)
7 			Remove oldest item from the queue (6)
			Remove oldest item from the queue (7)
			Remove non-existent item from the queue (nil)

Your task is to write a CircularQueue class that implements a circular queue for arbitrary objects. The class should obtain the buffer size with an argument provided to CircularQueue::new, and should provide the following methods:

    enqueue to add an object to the queue
    dequeue to remove (and return) the oldest object in the queue. It should return nil if the queue is empty.

You may assume that none of the values stored in the queue are nil (however, nil may be used to designate empty spots in the buffer).

Examples:

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

The above code should display true 15 times.

=end

class CircularQueue
  attr_reader :queue, :order

  def initialize(buffer_size)
    @queue = Array.new(buffer_size)
    @order = []
  end

  def enqueue(object)
    empty_slot_index = find_empty_slot_index
    
    if empty_slot_index
      @queue[empty_slot_index] = object
      @order.push(empty_slot_index)
    else
      oldest_index = remove_oldest_slot_index

      @queue[oldest_index] = object
      @order.push(oldest_index)
    end
  end

  def dequeue
    return nil if @order.empty?

    oldest_index = remove_oldest_slot_index
    object = @queue[oldest_index]

    @queue[oldest_index] = nil

    object
  end

  private

  def slot_empty?(value)
    value.nil?
  end

  def find_empty_slot_index
    @queue.find_index(nil)
  end

  def remove_oldest_slot_index
    @order.shift
  end
end



queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)

queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil