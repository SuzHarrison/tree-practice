class TreeNode
   attr_accessor :value, :left, :right

   def initialize(val)
     @value = val
     @left = nil
     @right = nil
   end
end

def print_infix(node)
  return if node == nil
  print_infix(node.left) #starts recursion -- go left
  print node.value + " " #print contents of this node
  print_infix(node.right) #go right
end


# 1. Let's write a method that prints out all the operators that exist in the tree.
def print_operators(node)
  return if node == nil
  print_operators(node.left) #starts recursion -- go left
  if node.value.match(/\+|\-|\/|\%|\*/) #if operators included
    print node.value + " " #print value of this node
  end
  print_operators(node.right) #recursion -- go right
end

# 2. Write a method that returns the count of non-operators (in this case, leaves) in the tree.
def print_non_operators(node)
  return if node == nil
  count_non_operators = 0
  print_non_operators(node.left) #starts recursion -- go left
  if node.value.match(/\d/) #if digits included
    count_non_operators += 1
    print node.value + " " #print value of this node
    # print node.count
  end
  print_non_operators(node.right)#go right
end


# 3. Write methods to print the tree in prefix
#evaluates parent, then left, then right
def print_prefix(node)
  return if node == nil
  print node.value + " " #print contents of this node
  print_prefix(node.left) #starts recursion -- go left
  print_prefix(node.right) #go right
end

# and postfix notations
#evaluates leaves from left, then right
#then parent
def print_postfix(node)
  return if node == nil
  print_postfix(node.left) #starts recursion -- go left
  print_postfix(node.right) #go right
  print node.value + " " #print contents of this node
end

#Write a method that returns whether or not a given operator exists in the tree.
def operator?(node, operator)
  return if node == nil
  operator?(node.left, operator) #starts recursion -- go left
  if node.value.match(/\+|\-|\/|\%|\*/) && (node.value == operator.value) #if operators included
    return true #true
  end
  operator?(node.right, operator) #recursion -- go right
end

root = TreeNode.new("-")
root.left = TreeNode.new("+")
root.left.left = TreeNode.new("3")
root.left.right = TreeNode.new("2")
root.right = TreeNode.new("10")
puts print_infix(root)
puts print_prefix(root)
puts print_postfix(root)
puts print_operators(root)
puts print_non_operators(root)

root2 = TreeNode.new("+")
root2.left = TreeNode.new("/")
root2.left.left = TreeNode.new("11")
root2.left.right = TreeNode.new("32")
root2.right = TreeNode.new("32")
puts print_infix(root2)
puts print_prefix(root2)
puts print_postfix(root2)
puts print_operators(root2)
puts print_non_operators(root2)

root3 = TreeNode.new("+")
root3.left = TreeNode.new("*")
root3.left.left = TreeNode.new("4")
root3.left.right = TreeNode.new("3")
root3.right = TreeNode.new("2")
puts print_infix(root3)
puts print_prefix(root3)
puts print_postfix(root3)
puts print_operators(root3)
puts print_non_operators(root3)

root4 = TreeNode.new("-")
root4.left = TreeNode.new("+")
root4.left.left = TreeNode.new("*")
root4.left.right = TreeNode.new("2")
root4.left.left.left = TreeNode.new("4")
root4.left.left.right = TreeNode.new("3")
root4.right = TreeNode.new("%")
root4.right.left = TreeNode.new("10")
root4.right.right = TreeNode.new("5")
puts print_infix(root4)
puts print_prefix(root4)
puts print_postfix(root4)
puts print_operators(root4)
puts print_non_operators(root4)
