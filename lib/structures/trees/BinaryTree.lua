require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: Node
-- param: key:num -> the key of the node
-- param: val:any -> the value of the node
-- A node of a binary tree that contains a key, a value and two children node pointers
local Node = class(function(self, key, val)
    self.val = val
    self.key = key
    self.izq = nil
    self.der = nil
end)

-- search: num -> Node
-- Checks if the key given is the same as the current node's and searches its children otherwise.
function Node.search(self, key)
    if key < self.key and (not (self.izq == nil))then
        return self.izq:search(key)
    elseif key > self.key and (not (self.der == nil)) then
        return self.der:search(key)
    else
        return self
    end
end

-- insert: num, any -> None
-- Inserts a new node with a key and value in the node's children.
function Node.insert(self, key, val)
    if key < self.key then
        if self.izq:isLeaf() then
            self.izq = Node.new(key, val)
        else
            self.izq:insert(val)
        end
    else
        if self.der == nil then
            self.der = Node.new(key,val)
        else
            self.der:insert(key,val)
        end
    end
end

-- remove: num, any -> None
-- Removes a node from the current node children.
-- TODO: Check this function, its kinda weird, should be checking for key not val
function Node.remove(self, key, val)
    if self.izq.val == val then
        if self.izq.izq == nil and self.izq.der == nil then
            self.izq = nil
        else
            self.izq:propagate()
        end
    elseif self.der.val == val then
        if self.der.izq == nil and self.der.der == nil then
            self.der = nil
        else
            self.der:propagate()
        end
    elseif self.key < key then
        self.izq:remove(key, val)
    elseif self.key >= key then
        self.der:remove(key, val)
    end
end

-- propagate: None -> None
-- After a node its removed this function is called to propagate the changes and leave the tree in a consistent form.
function Node.propagate(self)
    if math.random(2) == 1 and (not (self.izq == nil)) then
        self.val = self.tree.izq.val
        self.key = self.tree.izq.key
        if(self.izq.izq == nil) and (self.izq.der == nil) then
            self.izq = nil
        else
            self.izq:propagate()
        end
    elseif (not (self.der == nil)) then
        self.val = self.der.val
        self.key = self.der.key
        if(self.der.izq == nil) and (self.der.der == nil) then
            self.der = nil
        else
            self.der:propagate()
        end
    end
end

-- height: None -> int
-- Returns the current height of the nodes subtree (includes the current node)
function Node.height(self)
    local aux = 1
    if not self.izq == nil then
        aux = aux + self.izq:height()
    end
    if not self.der == nil then
        aux = aux + self.der:height()
    end
    return aux
end

-- toArray: None -> array(any)
-- Returns this subtree's values as an array
function Node.toArray(self)
    local aux = {}
    if not (self.izq == nil) then
        aux = self.izq:toArray()
    end

    aux[#aux + 1] = self.val

    if not (self.der == nil) then
        local aux2 = self.der:toArray()
        for i=1,#aux2 do
            aux[#aux+1] = aux2[i]
        end
    end

    return aux
end
--------------------------------------------------------------------------------------------------------

-- class: BinaryTree
-- A Binary search tree
local BinaryTree = class(function(self)
    self.tree = nil
end)

-- search: num -> Node | nil
-- Returns nil if the binary tree is empty or if it doesn't find the key in the tree. It returns the Node associated to
-- the key otherwise.
function BinaryTree.search(self, key)
    if self.tree == nil then
        return nil
    else
        return self.tree:search(key)
    end
end

-- isEmpty: None -> bool
-- Returns true if the binary tree is empty and false otherwise.
function BinaryTree.isEmpty(self)
    return self.tree == nil
end

-- insert: num, any -> None
-- Inserts a new node with the given key and value in the tree.
function BinaryTree.insert(self, key, val)
    if self.tree == nil then
        self.tree = Node.new(key, val)
    else
        self.tree:insert(key, val)
    end
end

-- remove: num, any -> None
-- Removes a node from the tree.
-- TODO: Check this function, its kinda weird, should be checking for key not val
function BinaryTree.remove(self, key, val)
    if self.tree.val == val and self.tree.izq == nil and self.tree.der == nil then
        self.tree = nil
    elseif self.tree.val == val then
        self.tree:propagate()
    else
        self.tree:remove(key, val)
    end
end

-- height: None -> int
-- Returns the current tree's height.
function BinaryTree.height(self)
    if self.tree == nil then
        return 0
    else
        return self.tree:height()
    end
end

-- toArray: None -> array(any)
-- Creates an array with the binary tree's values ordered.
function BinaryTree.toArray(self)
    if self.tree == nil then
        return {}
    else
        self.tree:toArray()
    end
end

return BinaryTree