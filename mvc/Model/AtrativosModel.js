class Atrativos{

    #id
    #nome
    #lat
    #long
    #desc
    #image

    constructor(id,nome,lat,long,desc,image,){
        this.#id = id
        this.#nome = nome 
        this.#lat = lat
        this.#long = long
        this.#desc = desc
        this.#image = image
    }

    get id(){
        return this.#id
    }

    set id(value){
        this.#id = value
    }

    get nome(){
        return this.#nome
    }

    set nome(value){
        this.#nome = value
    }
    
    get lat(){
        return this.#lat
    }

    set lat(value){
        this.#lat = value
    }

     get long(){
        return this.#long
    }

    set long(value){
        this.#long = value
    }

    get desc(){
        return this.#desc
    }

    set desc(value){
        this.#desc = value
    }
    
    get image(){
        return this.#image
    }

    set image(value){
        this.#image = value
    }

    toJson(){

        return {
            "id": this.#id,
            "nome": this.#nome,
            "lat": this.#lat,
            "long": this.#long,
            "desc": this.#desc,
            "image": this.#image
        }
      
    }
    
}

module.exports = Atrativos