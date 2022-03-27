<template>
    <div>
        <h2>{{ title }}</h2>
        <strong>List of all trainers : </strong>
        <ul class="list" v-if="trainers.length != 0">
            <li v-for="(trainer, index) in trainers" :key="index"> 
                {{ index+1 }} {{ trainer.name }} 
                <button v-on:click="login(index)"> Login </button> 
                <button v-on:click="deleteTrainer(index)"> Delete </button>
            </li> 
        </ul>

        <strong> Add new trainer : </strong>
        <input type="text" placeholder="Enter new name" v-model="inputName"/>
        <button v-on:click="addTrainer"> Add new trainer</button>    
    </div>
</template>

<script>
import Trainer from './Trainer.vue';
export default {
    data() {
        return {
            title: 'Login Page',
            inputName: '',
            trainers: []
        }
    },
    methods: {
        addTrainer( ) { 

            this.axios.post(`/api/trainers/`, { name: this.inputName})
                .then(
                    response => {
                        console.log(response);
                        
                        this.trainers.push(response.data);
                        this.inputName = '';
                    },
                     error => console.log(error)
                );
        },

        login(index) {
            localStorage.setItem("trainerId", this.trainers[index].id);
            localStorage.setItem("trainerName",  this.trainers[index].name);
            this.$emit('logged');
            this.$router.push('/');
        },

        deleteTrainer(index) {
            if(confirm("Do you really want to delete?")){
               this.axios.delete(`/api/trainers/` + this.trainers[index].id)
                .then(
                    response => {
                        console.log(response);
                        this.trainers.splice(index, 1);
                    },
                     error => console.log(error)
                );
            }            
        }
    },

    created() {
        this.axios.get('/api/trainers') 
            .then(
                response => {                    
                    this.trainers = response.data.trainers;
                },
                error => console.log(error)
            )
    } ,

    components: { Trainer }
}
</script>
