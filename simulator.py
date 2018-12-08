import random
from flask import Flask, jsonify
from flask.json import JSONEncoder
from calendar import timegm
import time
from enum import Enum

class GameObject(object):
    def __init__(self):
        super().__init__()
    def __init__(self, **entries):
        self.__dict__.update(entries)

class BoardPiece(GameObject):
    Empty = 1
    Bot = 2
    Enemy = 3
    Diamond = 4
    HomeBase = 5
    EnemyBase = 6

# A customized JSON encoder that knows about your SiteConfig class
class CustomJSONEncoder(JSONEncoder):
    item_separator = ','
    key_separator = ':'
    def default(self, obj):
        if isinstance(obj, GameObject):
            return obj.__dict__
        try:
            iterable = iter(o)
        except TypeError:
            pass
        else:
            return list(iterable)
        return JSONEncoder.default(self, obj)

class Position(GameObject):
    def __init__(self, fromDict=None, x=None, y=None):
        super(Position, self).__init__()
        self.x = x
        self.y = y

class Entity(GameObject):
    def __init__(self, fromDict=None, position=None, id=None, boardPiece=None):
        super(Entity, self).__init__()
        if(fromDict == None):
            self.position = position
            self.id = id
            self.boardPiece = boardPiece
        else:
            self.position = Position(fromDict=fromDict['position'])
            self.id = fromDict['id']
            self.boardPiece = fromDict['boardPiece']

class Board(GameObject):
    def __init__(self, fromDict=None, height=None, width=None, numEnemies=None):
        super().__init__()
        if(fromDict == None):
            self.height = height
            self.width = width
            self.numEnemies = numEnemies
            self.initEntities()
        else:
            self.height = fromDict['height']
            self.width = fromDict['width']
            self.numEnemies = fromDict['numEnemies']
            for entity in fromDict['entities']:
                self.entities = []
                self.entities.append(Entity(fromDict=entity))
    
    def initEntities(self):
        field = []
        field.append(BoardPiece.HomeBase)
        field.append(BoardPiece.EnemyBase)
        field.append(BoardPiece.Bot)
        for _i in range(self.numEnemies):
            field.append(BoardPiece.Enemy)
        while(len(field) < self.height*self.width):
            field.append(BoardPiece.Empty)
        random.shuffle(field)
        self.entities = []
        id = 0
        for x in range(self.width):
            for y in range(self.height):
                boardPiece = field[y*self.width+x]
                if(boardPiece > BoardPiece.Empty):
                    self.entities.append(Entity(position=Position(x=x,y=y),id=id,boardPiece=boardPiece))
                    id += 1



class Score(GameObject):
    def __init__(self):
        super().__init__()
        # how many times did the bot return a diamond to your base
        self.rescued = 0
        # how many times did the enemy return a diamond to their base, or leave a diamond on the field at the end
        self.lost = 0

class Simulator(GameObject):
    def __init__(self, fromDict=None, seed=None, height=640, width=640, numEnemies=1):
        super().__init__()
        if(fromDict == None):
            if(seed == None):
                seed = int(round(time.time() * 1000 * 1000))
            self.randomSeed = seed
            random.seed(seed)
            self.board = Board(height=height, width=width, numEnemies=numEnemies)
        else:
            self.randomSeed = fromDict['randomSeed']
            self.board = Board(fromDict=fromDict['board'])