--------------------------------------------------------------------------------------------------------
local Node = {}
Node.__index = {}

function Node.new(key, val)
    local o = {}
    local self = setmetatable(o, Node)
    self.__index = self
    self.val = val
    self.key = key
    self.izq = nil
    self.der = nil
    return self
end

function Node.search(self, key)
    if key < self.key and (not (self.izq == nil))then
        return self.izq:search(key)
    elseif key > self.key and (not (self.der == nil)) then
        return self.der:search(key)
    else
        return self
    end
end

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
local BinaryTree = {}
BinaryTree.__index = BinaryTree

function BinaryTree.new()
    local o = {}
    local self = setmetatable(o, BinaryTree)
    self.__index = self
    self.tree = nil
    return self
end

function BinaryTree.search(self,key)
    if self.tree == nil then
        return nil
    else
        return self.tree:search(key)
    end
end

function BinaryTree.isEmpty(self)
    return self.tree == nil
end

function BinaryTree.insert(self, key, val)
    if self.tree == nil then
        self.tree = Node.new(key, val)
    else
        self.tree:insert(key, val)
    end
end

function BinaryTree.remove(self, key, val)
    if self.tree.val == val and self.tree.izq == nil and self.tree.der == nil then
        self.tree = nil
    elseif self.tree.val == val then
        self.tree:propagate()
    else
        self.tree:remove(key, val)
    end
end

function BinaryTree.height(self)
    return self.tree:height()
end

function BinaryTree.toArray(self)
    return self.tree:toArray()
end

return BinaryTree