<template>
    <div>
    <h2>{{ title }}</h2>
        <ul class="list" v-if="trainers.length != 0">
            <li v-for="(trainer, index) in trainers" :key="index"> 
                {{ index+1 }} {{ trainer }}
                <button v-on:click="login(trainer)"> Login </button> 
                <button v-on:click="deleteTrainer(index)"> Delete </button> 
            </li> 
        </ul>

        <strong> Add new trainer</strong>
        <div class="form-control">
            <input type="text" placeholder="Enter new name" v-model="inputName"/>
        </div>        
        <button v-on:click="addTrainer"> Add new trainer</button>    
    </div>
</template>

<script>

export default {
    data() {
        return {
            title: 'Login Page',
            inputName: '',
            trainers: ['Alex']
        }
    },
    methods: {
        addTrainer( ) {
            console.log(this.inputName);
            this.trainers.push(this.inputName);
            this.inputName = '';
            // this.$router.push(newTrainer)
        },
        login(name, index) {
            localStorage.setItem("trainerId", index);
            localStorage.setItem("trainerName", name);
        },
        deleteTrainer(index) {
            this.trainers.splice(index,1); // TODO use http
        }
    },
    created() {
        this.$http.get('http://localhost:3000/trainer') //  should return all     @trainer = Trainer.all to rails, how to return to here?
            .then(
                response => {console.log(response); response.json();},
                error => alert("error")
            )
            .then(events => this.events = events);
    }
}
</script>
