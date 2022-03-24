<template>
    <div>
        <router-link to="/"  active-class="active">Back to Trainer</router-link>
        <br>
        <strong>List of all trainees :</strong>
        <ul class="list" v-if="trainees.length != 0">
            <li v-for="(trainee, index) in trainees" :key="index"> 
                {{ index+1 }} Name: {{ trainee.name }}; Last Event: {{ trainee.date}} 
            </li> 
        </ul>

        <strong>Add New Trainee :</strong>
        <input type="text" v-model="name">
        <button v-on:click="addTrainee">Add</button>
    </div>
</template>

<script>

export default {
    data() {
        return {
            trainerId: undefined,
            name: '',
            trainees: [] 
        }
    },
    methods: {
        addTrainee() {
            this.axios.post(`/api/trainees/`, { name: this.name, trainer_id: this.trainerId}) // TODO add eventId ?
                .then(
                    response => {
                        this.trainees.push({name: this.name, date: 'Never'});
                        this.name = '';
                    },
                     error => console.log(error)
                );
        }
    },
    mounted() {
        this.trainerId =  localStorage.getItem("trainerId");
        this.axios.get('/api/trainees?trainer_id=' + this.trainerId) 
            .then(
                response => {                    
                    this.trainees = response.data;
                    this.trainees.map( item => {
                        if(item.last_event != undefined) {
                            const date = new Date(item.last_event.date);
                            item.date = date.getUTCFullYear() + '-' + (date.getUTCMonth() + 1 ) + '-' + date.getUTCDate();
                        }
                        else {
                            item.date = 'Never';
                        }
                        return item;
                    });
                },
                error => console.log(error)
            )
    } ,
}
</script>
