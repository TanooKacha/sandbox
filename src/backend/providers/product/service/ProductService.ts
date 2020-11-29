import { Injectable, Scope } from "@nestjs/common";
import { Product } from '../entity/Product';

@Injectable({scope: Scope.REQUEST})    
export class ProductService  {    
    public getProducts() {        
        return Product.findAll();
    }

    public async getRandomProducts(count: number) {
        const totalProductCount = await Product.count()
        const randomOffset = Math.floor(Math.random() * (totalProductCount - count))

        return Product.findAll({
            limit: count,
            offset: randomOffset
        })
    }

    public async createProduct(name: string): Promise<void> {
        try {
            await Product.build({name: name}).save()            
        } catch (e) {
            console.log(`save error ${e}`)
            throw e
        }
    }
}
