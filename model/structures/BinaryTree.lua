require "class"
--------------------------------------------------------------------------------------------------------
Node = class(function(n, key, val)
    n.val = val
    n.key = key
    n.izq = nil
    n.der = nil
end)

function Node:search(key)
    if key < self.key and (not (self.izq == nil))then
        return self.izq:search(key)
    elseif key > self.key and (not (self.der == nil)) then
        return self.der:search(key)
    else
        return self
    end
end

function Node:insert(key, val)
    if key < self.key then
        if self.izq == nil then
            self.izq = Node(key,val)
        else
            self.izq:insert(val)
        end
    else
        if self.der == nil then
            self.der = Node(key,val)
        else
            self.der:insert(key,val)
        end
    end
end

function Node:remove(key, val)
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

function Node:propagate()
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
--------------------------------------------------------------------------------------------------------
BinaryTree = class(function(bt)
    bt.tree = nil
end)

function BinaryTree:search(key)
    if self.tree == nil then
        return nil
    else
        return self.tree:search(key)
    end
end

function BinaryTree:isEmpty()
    return self.tree == nil
end

function BinaryTree:insert(key, val)
    if self.tree == nil then
        self.tree = Node(key, val)
    else
        self.tree:insert(key, val)
    end
end

function BinaryTree:remove(key, val)
    if self.tree.val == val and self.tree.izq == nil and self.tree.der == nil then
        self.tree = nil
    elseif self.tree.val == val then
        self.tree:propagate()
    else
        self.tree:remove(key, val)
    end
end

