def flatten(root)
  nodes = []
  preorder(root, nodes)
  #puts nodes.inspect
  i = 0
  while i < nodes.length
    nodes[i].right = nodes[i+1]
    i += 1
  end
  nodes[0]
end

def preorder(root, nodes)
  return nil if !root
  nodes << root
  preorder(root.left, nodes)
  preorder(root.right, nodes)
  root.left = nil
  root.right = nil
end
