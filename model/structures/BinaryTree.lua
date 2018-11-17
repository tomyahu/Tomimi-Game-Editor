require "class"
--------------------------------------------------------------------------------------------------------
Node = class(function(n, val)
    n.val = val
    n.izq = nil
    n.der = nil
end)

function Node:search(val)
    if val == self.val then
        return val
    end

    if val < self.val and (not (self.izq == nil))then
        return self.izq:search()
    elseif val > self.val and (not (self.der == nil)) then
        return self.der:search()
    else
        return self.val
    end
end

function Node:insert(val)
end

function Node:remove(val)
end
--------------------------------------------------------------------------------------------------------
BinaryTree = class(function(bt)
    bt.tree = nil
end)

function BinaryTree:search(val)
    if self.tree == nil then
        return nil
    else
        return self.tree:search(val)
    end
end

function BinaryTree:isEmpty()
    return self.tree == nil
end

function BinaryTree:insert(val)
    if self.tree == nil then
        self.tree = Node(val)
    else
        self.tree:insert(val)
    end
end

function BinaryTree:remove(val)
    if self.tree.val == val and self.tree.izq == nil and self.tree.der == nil then
        self.tree = nil
    elseif self.tree.val == val then
        randint = math.random(2)
        if randint == 1 and (not (self.tree.izq == nil)) then
            self.tree.val = self.tree.izq.val
            self.tree.izq:propagate(self.tree)
        else
            self.tree.val = self.tree.der.val
            self.tree.der:propagate(self.tree)
        end
    else
        self.tree:remove()
    end
end