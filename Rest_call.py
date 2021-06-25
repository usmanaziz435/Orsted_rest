#Package Installation.
from flask import Flask
from flask_restful import Api, Resource, reqparse
import pandas as pd
import sqlalchemy as sa
import psycopg2
import json

#Define Global Attributes use in script
app = Flask(__name__)
api = Api(app)
engine = sa.create_engine('postgresql+psycopg2://postgres:dbc@localhost:5432/Rest_API')

#Class to add objects for Rest API get.
class Users(Resource):


        



    def get(self):
        parser = reqparse.RequestParser()
        parser.add_argument('col', required=True)
        parser.add_argument('agg', required=True)
        parser.add_argument('groupby', required=True)
        parser.add_argument('product_duration', required=True)
        args = parser.parse_args()
        arg_list = [x for x in args]
        print(arg_list)



        col=args['col']
        print(col)
        agg=args['agg']
        print(agg)
        cols=args['groupby']
        print(cols)
        fil= args['product_duration']
        

        query = """SELECT 
                    %s
                    ,%s(%s)
                    FROM public."Market_Data"
                    WHERE product_duration='%s'
                    GROUP BY %s"""%(cols,agg,col,fil,cols)
        print(query)
        
        #i=engine.execute(query)
        df=pd.read_sql(query,con=engine)
        #df=pd.DataFrame(i.fetchall())
        out=df.to_dict('records')
        
        return out, 200




# Add URL endpoints
api.add_resource(Users, '/users')

#added 0.0.0.0 so that i can access using localhost from container as database is not working so i can run through the process from my machine.
if __name__ == '__main__':
    app.run(host='0.0.0.0')


